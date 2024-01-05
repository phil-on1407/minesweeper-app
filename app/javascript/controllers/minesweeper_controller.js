import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="minesweeper"
export default class extends Controller {
  connect() {
    this.board = this.element.querySelector("#board");
    this.playAgainBtn = this.element.querySelector("#playAgainBtn");
    this.gameOver = false;

    if (this.board) {
      this.rowCount = parseInt(this.data.get("height"));
      this.colCount = parseInt(this.data.get("width"));
      this.mineCount = parseInt(this.data.get("mines"));

      this.gameState = [];

      for (let i = 0; i < this.rowCount; i++) {
        this.gameState[i] = [];
        for (let j = 0; j < this.colCount; j++) {
          this.gameState[i][j] = {
            value: 0,
            revealed: false,
          };
        }
      }

      for (let i = 0; i < this.mineCount; i++) {
        let row = Math.floor(Math.random() * this.rowCount);
        let col = Math.floor(Math.random() * this.colCount);
        this.gameState[row][col].value = -1;
      }

      for (let i = 0; i < this.rowCount; i++) {
        let rowElement = document.createElement("div");
        rowElement.classList.add("row");

        for (let j = 0; j < this.colCount; j++) {
          let cell = document.createElement("div");
          cell.classList.add("cell");
          cell.setAttribute("data-row", i);
          cell.setAttribute("data-col", j);

          cell.addEventListener("click", () => this.handleCellClick(cell));

          rowElement.appendChild(cell);
        }
        this.board.appendChild(rowElement);
      }
    }
  }

  handleCellClick(cell) {
    if (!this.gameOver) {
      let row = parseInt(cell.getAttribute("data-row"));
      let col = parseInt(cell.getAttribute("data-col"));

      if (!this.gameState[row][col].revealed) {
        if (this.gameState[row][col].value === -1) {
          cell.classList.add("exploded");
          this.gameOver = true;
          this.playAgainBtn.style.display = "block";
        } else {
          let nearMines = 0;
          let color;

          for (let x = -1; x <= 1; x++) {
            for (let y = -1; y <= 1; y++) {
              if (
                this.gameState[row + x] &&
                this.gameState[row + x][col + y] &&
                this.gameState[row + x][col + y].value === -1
              ) {
                nearMines++;
              }
            }
          }

          switch (nearMines) {
            case 0:
              color = "transparent";
              break;
            case 1:
              color = "blue";
              break;
            case 2:
              color = "green";
              break;
            case 3:
              color = "red";
              break;
            case 4:
              color = "darkblue";
              break;
            default:
              color = "darkred";
          }

          cell.classList.add(color, "clear");
          cell.textContent = nearMines;
          this.gameState[row][col].revealed = true;

          if (this.gameState[row][col].value === -1) {
            this.gameOver = true;
            this.playAgainBtn.style.display = "block";
          }
        }
      }
    }
  }
  playAgain() {
    location.reload();
  }
}
