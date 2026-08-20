import os
import discord
import aiohttp
from discord import app_commands

TOKEN = os.getenv(DISCORD_TOKEN)
API_KEY = os.getenv(API_KEY)
API_URL = httpsapi.hydroelectric.comv2status

intents = discord.Intents.default()

client = discord.Client(intents=intents)
tree = app_commands.CommandTree(client)

async def get_status()
    headers = {
        Authorization API_KEY
    }

    async with aiohttp.ClientSession() as session
        response = await session.get(API_URL, headers=headers)

        if response.status == 200
            return await response.json()

        print(API error, response.text())
        return None


@tree.command(name=status, description=Check the HES system status)
async def status(interaction discord.Interaction)
    data = await get_status()

    if not data
        await interaction.response.send_message(
            Failed to retrieve system status. Please try again later.,
            ephemeral=True
        )
        return

    embed = discord.Embed(
        title=HES System Status,
        color=discord.Color.green()
    )

    embed.add_field(
        name=Website,
        value=data[website]
    )

    embed.add_field(
        name=Roblox,
        value=data[roblox]
    )

    await interaction.response.send_message(embed=embed)


@client.event
async def on_ready()
    print(fLogged in as {client.user})
    await tree.sync()


client.run(TOKEN)