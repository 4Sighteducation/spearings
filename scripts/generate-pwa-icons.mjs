import sharp from 'sharp';
import { mkdirSync } from 'fs';
import { resolve } from 'path';

const src = resolve('public/images/crest-logo-header-new.png');
const outDir = resolve('public/icons');
mkdirSync(outDir, { recursive: true });

const bgColor = { r: 14, g: 35, b: 24, alpha: 1 }; // --g-800 #0e2318
const creamHex = '#fffdf7';

/**
 * Crest centred on a cream circular “badge” on the dark green square (reads well on home screens).
 */
async function buildIcon(size, circleRadiusRatio, filename) {
  const circleR = Math.round(size * circleRadiusRatio);
  const svgCircle = Buffer.from(
    `<svg width="${size}" height="${size}" xmlns="http://www.w3.org/2000/svg">
  <circle cx="${size / 2}" cy="${size / 2}" r="${circleR}" fill="${creamHex}"/>
</svg>`,
  );

  const circlePng = await sharp(svgCircle).png().toBuffer();

  const logoMax = Math.round(circleR * 2 * 0.68);
  const logo = await sharp(src)
    .resize(logoMax, logoMax, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .toBuffer();

  await sharp({
    create: { width: size, height: size, channels: 4, background: bgColor },
  })
    .composite([
      { input: circlePng, left: 0, top: 0 },
      { input: logo, gravity: 'centre' },
    ])
    .png()
    .toFile(resolve(outDir, filename));
}

const sizes = [192, 512];
const maskablePadding = 0.15;

for (const size of sizes) {
  await buildIcon(size, 0.42, `icon-${size}x${size}.png`);
  const innerRatio = 0.42 * (1 - maskablePadding * 0.35);
  await buildIcon(size, innerRatio, `icon-${size}x${size}-maskable.png`);
  console.log(`Generated ${size}x${size}`);
}

const appleSize = 180;
await buildIcon(appleSize, 0.42, 'apple-touch-icon.png');
console.log('Generated apple-touch-icon 180x180');
console.log('Done!');
