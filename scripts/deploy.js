require('dotenv').config();
const { API_URL, PRIVATE_KEY } = process.env;
async function main() {
    const provider = new ethers.providers.JsonRpcProvider(API_URL);
    const account1 = new ethers.Wallet(
        PRIVATE_KEY,
        provider,
    );
  
    // const MyNFT = await ethers.getContractFactory("MyNFT");
 
    // // Start deployment, returning a promise that resolves to a contract object
    // const myNFT = await MyNFT.deploy();
    // console.log("Contract deployed to address:", myNFT.address);
    // const abc = await myNFT.connect(account1).mintNFT(account1.address,"newNFt")
    // console.log(abc)

    const TrikonToken = await ethers.getContractFactory("TrikonToken");
    const trikonToken = TrikonToken.attach("0x7F3DB462d685024325751F5ed8f225c12B78c772");

    // Start deployment, returning a promise that resolves to a contract object
    // const trikonToken = await TrikonToken.deploy(10000000000);
    console.log("Contract deployed to address:", trikonToken.address);

    // const abc = await trikonToken.connect(account1).transfer("0x74bC67ed6948f0a4C387C353975F142Dc640537a", 100000)
    const bc = await trikonToken.balanceOf("0x74bC67ed6948f0a4C387C353975F142Dc640537a")
    console.log("Moneyyyyyyyyyyyy",bc)

 }
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });