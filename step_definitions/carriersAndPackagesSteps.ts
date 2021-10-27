import { CarriersAndPackagesPage } from '../pages/carriersAndPackagesPage';

const carrierAndPackagesPage: CarriersAndPackagesPage = new CarriersAndPackagesPage();

export async function selectCarriers(carriers) {
  for (let carrier of carriers) {
    await carrierAndPackagesPage.clickCarrierPackageCard(carrier);
  }
}

export async function selectPackage(packageName) {
  await carrierAndPackagesPage.clickCarrierPackageCard(packageName);
}
