const { ApiSession } = require("@buidlerlabs/hashgraph-venin-js");


async function main() {
    
const { session } = await ApiSession.default();
const liveContract = await session.getLiveContract({
  id: "0.0.4342654",
});
console.log(liveContract);
// const chair_address = await liveContract.chair();
// log(chair_address);
}



main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });