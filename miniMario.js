class PlatformLevel extends Phaser.Scene {
  constructor() {
    super({ key: 'PlatformLevel' });

    this.platforms        = null;
    this.floatingPlatform = null;
    this.player           = null;
    this.playerLocked     = false;   // ← fixed typo: thisplayerLocked → this.playerLocked
    this.enemyMultiplier  = 1;
    this.totalEnemies     = 28;
    this.minEnemies       = 1;
    this.difficultyDisplay = null;
    this.bestClearDisplay  = null;
    this.bestClearLevel    = 0;
    this.progressPerLife   = [];
  }
}