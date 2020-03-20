const images = require.context("../images", true);
export const imagePath = (name: string) => images(name);
