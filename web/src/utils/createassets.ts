import { store } from '../store';
import { ICreateAssetPayload } from '../typings';
import { fetchNui } from './fetchNui';
import { Sleep } from './misc';

export class Queue<T extends { resolve?: (value: unknown) => void }> {
  started: boolean = false;
  process: (...args: any) => any;
  private elements: Record<number, T> = {};
  private head: number = 0;
  private tail: number = 0;
  constructor(process: (props: Omit<T, 'resolve'>) => any) {
    this.process = process;
    this.queueThread();
  }

  public enqueue(element: T): void {
    this.elements[this.tail] = element;
    this.tail++;
    console.log('enqueue', this.length);
  }

  public dequeue(): T {
    const item = this.elements[this.head];
    delete this.elements[this.head];
    this.head++;

    return item;
  }

  public peek(): T {
    return this.elements[this.head];
  }

  public get length(): number {
    return this.tail - this.head;
  }

  public get isEmpty(): boolean {
    return this.length === 0;
  }

  async queueThread() {
    while (true) {
      if (this.isEmpty) {
        await Sleep(1000);
      } else {
        const { resolve, ...rest } = this.dequeue();
        const response = await this.process({ ...rest });
        console.log('Queue process response', response);
        console.log('end queue thread', this.length, this.isEmpty);
        if (resolve) {
          resolve(response);
        }
      }
    }
  }
}

class CreateAssets {
  queue = new Queue<{ payload: ICreateAssetPayload; resolve: (value: any) => void }>(({ payload }) => {
    console.log('process queue', payload);
    return new Promise((resolve) => {
      /* emit('screenshot:takeScreenshot', payload, (data: string) => {
          resolve(data)
          this.hidePage('TakingAsset')
        }) */
      fetchNui<string>('screenshot:takeScreenshot', payload).then((data) => {
        resolve(data);
        // this.hidePage('TakingAsset')
      });
    });
  });
  constructor() {
    console.log('CreateAssets constructor');
  }

  add(payload: ICreateAssetPayload): Promise<string> {
    return new Promise((resolve) => {
      this.queue.enqueue({ payload, resolve });
    });
  }
}

const createAssets = new CreateAssets();

export default createAssets;
