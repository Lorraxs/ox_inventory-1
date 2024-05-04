export type ItemData = {
  name: string;
  label: string;
  stack: boolean;
  usable: boolean;
  close: boolean;
  count: number;
  description?: string;
  buttons?: string[];
  ammoName?: string;
  image?: string;
};

export interface ColorRGB {
  readonly r: number;
  readonly g: number;
  readonly b: number;
  readonly a?: number;
}

export enum EVehiclePainType {
  Normal,
  Metallic,
  Pearl,
  Matte,
  Metal,
  Chrome,
}

export type IVehicleColor = number[];

export interface IVehicleMods {
  VMT_SPOILER?: number;
  VMT_BUMPER_F?: number;
  VMT_BUMPER_R?: number;
  VMT_SKIRT?: number;
  VMT_EXHAUST?: number;
  VMT_CHASSIS?: number;
  VMT_GRILL?: number;
  VMT_BONNET?: number;
  VMT_WING_L?: number;
  VMT_WING_R?: number;
  VMT_ROOF?: number;
  VMT_ENGINE?: number;
  VMT_BRAKES?: number;
  VMT_GEARBOX?: number;
  VMT_HORN?: number;
  VMT_SUSPENSION?: number;
  VMT_ARMOUR?: number;
  VMT_NITROUS?: number;
  VMT_TURBO?: boolean;
  VMT_SUBWOOFER?: number;
  VMT_TYRE_SMOKE?: boolean;
  VMT_HYDRAULICS?: number;
  VMT_XENON_LIGHTS?: boolean;
  VMT_WHEELS?: number;
  VMT_WHEELS_REAR_OR_HYDRAULICS?: number;
  VMT_PLTHOLDER?: number;
  VMT_PLTVANITY?: number;
  VMT_INTERIOR1?: number;
  VMT_INTERIOR2?: number;
  VMT_INTERIOR3?: number;
  VMT_INTERIOR4?: number;
  VMT_INTERIOR5?: number;
  VMT_SEATS?: number;
  VMT_STEERING?: number;
  VMT_KNOB?: number;
  VMT_PLAQUE?: number;
  VMT_ICE?: number;
  VMT_TRUNK?: number;
  VMT_HYDRO?: number;
  VMT_ENGINEBAY1?: number;
  VMT_ENGINEBAY2?: number;
  VMT_ENGINEBAY3?: number;
  VMT_CHASSIS2?: number;
  VMT_CHASSIS3?: number;
  VMT_CHASSIS4?: number;
  VMT_CHASSIS5?: number;
  VMT_DOOR_L?: number;
  VMT_DOOR_R?: number;
  VMT_LIVERY_MOD?: number;
  VMT_LIGHTBAR?: number;
  modLivery?: number;
}

export interface IVehicleProperties {
  health?: number; //GetEntityHealth(vehicle)
  engineHealth?: number; //GetVehicleEngineHealth(vehicle)
  dirtLevel?: number; //GetVehicleDirtLevel(vehicle),
  fuelLevel?: number;
  colorPrimary?: number;
  colorSecondary?: number;
  customColorPrimary?: ColorRGB;
  customColorSecondary?: ColorRGB;
  pearlescentColor?: number;
  rimColor?: number;
  modColor1?: {
    type: EVehiclePainType;
    color: number;
  };
  modColor2?: {
    type: EVehiclePainType;
    color: number;
  };
  wheelColor?: number;
  wheels?: number; //GetVehicleWheelType(vehicle),
  windowTint?: number; //        = GetVehicleWindowTint(vehicle),
  neonEnabled?: boolean[];
  extras?: boolean[]; //IsVehicleExtraTurnedOn
  neonColor?: IVehicleColor;
  tyreSmokeColor?: IVehicleColor;
  mods?: IVehicleMods;
  plateIndex?: number;
  doorStatus?: boolean[];
  windowStatus?: number[];
  tyreStatus?: boolean[];
}

export interface ICreateAssetVehicle {
  bucket: 'vehicles';
  name: string;
  props?: IVehicleProperties;
}

export interface ICreateAssetOwnedVehicle {
  bucket: 'owned_vehicles';
  name: string;
  vehicleName: string;
  props?: IVehicleProperties;
}

export interface ICreateAssetClothe {
  bucket: 'items';
  type: 'component' | 'props';
  componentId: number;
  drawableId: number;
  textureId: number;
  name: string;
  gender: 'male' | 'female';
}

export type ICreateAssetPayload = ICreateAssetVehicle | ICreateAssetClothe | ICreateAssetOwnedVehicle;
