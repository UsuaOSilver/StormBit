import React, { useEffect } from "react";
import { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { useContractReads } from "wagmi";
import { useScaffoldContract, useScaffoldContractRead, useScaffoldEventHistory } from "~~/hooks/scaffold-eth";

interface PoolData {
  name: string;
}

function Table() {
  const [poolList, setPoolList] = useState([] as PoolData[]);

<<<<<<< HEAD
<<<<<<< HEAD
  const poolId = 1;
  const { data } = useScaffoldContractRead({
    contractName: "StormBit",
    functionName: "getPoolData",
    args: [BigInt(poolId)],
=======
=======
>>>>>>> 814ce69 (merge conflicts)
  // get the events from the contract
  const { data: poolAddresses, isLoading: poolAddressesLoading } = useScaffoldContractRead({
    contractName: "StormBitCore",
    functionName: "getPools",
    watch: true,
<<<<<<< HEAD
>>>>>>> 69410e3 (merge conflicts)
=======
>>>>>>> 814ce69 (merge conflicts)
  });

  const { data: LendingContract } = useScaffoldContract({
    contractName: "StormBitLending",
  });

  const { data: pools, isLoading: poolsLoading } = useContractReads({
    contracts:
      LendingContract && poolAddresses
        ? poolAddresses.map(pool => {
            return {
              address: pool,
              abi: LendingContract.abi,
              functionName: "getPoolData",
            };
          })
        : [],
  });

  useEffect(() => {
    if (pools && pools.length > 0) {
      setPoolList(
        pools.map(pool => {
          console.log(pool.result);
          return {
            name: pool.result ? pool.result.name : "",
          };
        }),
      );
    }
  }, [pools]);

  return (
    <div className="w-[1450px] flex flex-col">
      <div className="flex gap-4 h-[95px] items-center p-8 border border-solid border-[#EAEBEF]">
        <span className="w-[160px] text-center">Pool</span>
        <span className="w-[160px] text-center">Market SIze</span>
        <span className="w-[160px] text-center">Total Supplied</span>
        <span className="w-[160px] text-center">Supply APY</span>
        <span className="w-[160px] text-center">Total Borrowed</span>
        <span className="w-[160px] text-center">Borrow APY</span>
        <span className="w-[160px] text-center"></span>
      </div>
      {poolList.map((pool, index) => (
        <div key={index} className="flex gap-4 h-[95px] items-center p-8 border border-solid border-[#EAEBEF]">
          <p className="w-[160px] text-center">{pool.name}</p>
          <p className="w-[160px] text-center">{}</p>
          <p className="w-[160px] text-center">{}</p>
          <p className="w-[160px] text-center">{}</p>
          <p className="w-[160px] text-center">{}</p>
          <p className="w-[160px] text-center">{}</p>
          <Link href="/pool">
            <button className="border border-solid border-[#4A5056] rounded-[7px] py-4 px-10">Trade</button>
          </Link>
          <Link href="/pool">
            <Image src="/chevron-right.png" alt="chevron" width={24} height={24}></Image>
          </Link>
        </div>
      ))}
    </div>
  );
}

export default Table;
