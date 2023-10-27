

async function main() {


  // Deploy Storage contract
  const Storage = await ethers.getContractFactory('Storage');
  const storage = await Storage.deploy();
  await storage.deployed();

  console.log('Storage contract deployed to:', storage.address);

  // Deploy Dog contract
  const Dog = await ethers.getContractFactory('Dog');
  const dog = await Dog.deploy();
  await dog.deployed();

  console.log('Dog contract deployed to:', dog.address);

  // Deploy Proxy contract and set the Dog contract as the target
  const Proxy = await ethers.getContractFactory('Proxy');
  const proxy = await Proxy.deploy(dog.address); // Pass the address of the Dog contract
  await proxy.deployed();

  console.log('Proxy contract deployed to:', proxy.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
