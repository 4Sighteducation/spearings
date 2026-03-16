import sharp from 'sharp';
import { mkdirSync } from 'fs';
import { resolve } from 'path';

const src = resolve('public/images/crest-logo-header-new.png');
const outDir = resolve('public/icons');
mkdirSync(outDir, { recursive: true });

const bgColor = { r: 14, g: 35, b: 24, alpha: 1 }; // --g-800 #0e2318

const sizes = [192, 512];
const maskablePadding = 0.15; // 15% safe zone

for (const size of sizes) {
  // Standard icon: logo on dark green background
  const padded = Math.round(size * 0.15);
  const logoSize = size - padded * 2;

  const logo = await sharp(src)
    .resize(logoSize, logoSize, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .toBuffer();

  await sharp({
    create: { width: size, height: size, channels: 4, background: bgColor },
  })
    .composite([{ input: logo, gravity: 'centre' }])
    .png()
    .toFile(resolve(outDir, `icon-${size}x${size}.png`));

  // Maskable icon: extra padding for safe zone
  const maskPad = Math.round(size * maskablePadding);
  const maskLogoSize = size - maskPad * 2;

  const maskLogo = await sharp(src)
    .resize(maskLogoSize, maskLogoSize, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
    .toBuffer();

  await sharp({
    create: { width: size, height: size, channels: 4, background: bgColor },
  })
    .composite([{ input: maskLogo, gravity: 'centre' }])
    .png()
    .toFile(resolve(outDir, `icon-${size}x${size}-maskable.png`));

  console.log(`Generated ${size}x${size}`);
}

// Apple touch icon (180x180)
const appleSize = 180;
const applePad = Math.round(appleSize * 0.12);
const appleLogo = await sharp(src)
  .resize(appleSize - applePad * 2, appleSize - applePad * 2, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
  .toBuffer();

await sharp({
  create: { width: appleSize, height: appleSize, channels: 4, background: bgColor },
})
  .composite([{ input: appleLogo, gravity: 'centre' }])
  .png()
  .toFile(resolve(outDir, 'apple-touch-icon.png'));

console.log('Generated apple-touch-icon 180x180');
console.log('Done!');
