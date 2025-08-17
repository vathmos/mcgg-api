import { Commander } from "../generated/prisma";

type CommanderDto = {
  name: string;
  portraitImageUrl: string | null,
  iconImageUrl: string | null,
  url: string;
};

export default function commanderToDto(commander: Commander): CommanderDto {
  return {
    name: commander.name,
    portraitImageUrl: commander.portraitImageUrl,
    iconImageUrl: commander.iconImageUrl,
    url: `${process.env.BASE_URL}/commanders/${commander.id}`,
  };
}
