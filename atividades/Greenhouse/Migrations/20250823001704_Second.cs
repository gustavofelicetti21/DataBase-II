using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Greenhouse.Migrations
{
    /// <inheritdoc />
    public partial class Second : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Plant",
                table: "Plant");

            migrationBuilder.AlterColumn<string>(
                name: "PlantName",
                table: "Plant",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "Plant",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Plant",
                table: "Plant",
                column: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Plant",
                table: "Plant");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "Plant");

            migrationBuilder.AlterColumn<string>(
                name: "PlantName",
                table: "Plant",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Plant",
                table: "Plant",
                column: "PlantName");
        }
    }
}
