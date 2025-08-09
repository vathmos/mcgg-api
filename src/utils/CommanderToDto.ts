import { Commander } from "../generated/prisma";

type CommanderDto = {
  name: string;
  url: string;
};

export default function commanderToDto(commander: Commander): CommanderDto {
  return {
    name: commander.name,
    url: `${process.env.BASE_URL}/commanders/${commander.id}`,
  };
}
