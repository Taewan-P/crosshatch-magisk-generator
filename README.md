# crosshatch-magisk-generator
This is an automated repository that creates magisk-patched boot image for Pixel 3 XL (crosshatch).

### Disclaimer

**Use at your own risk!!** I am not responsible for whatever you do with your device. 

### How-to steps

1. Open `image_info.json` and edit as you like.

   ```json
   {
   	"build_number": "RQ3A.210905.001",
   	"link": "https://dl.google.com/dl/android/aosp/crosshatch-rq3a.210905.001-factory-94be46cc.zip",
   	"checksum": "94be46cc1873c273aaf16df6af2020980f90a402ace9f3327c1b839093cc133c",
   	"magisk": "https://github.com/topjohnwu/Magisk/releases/download/v23.0/Magisk-v23.0.apk"
   }
   ```

   

   * `build_number`: The build number that you are trying to update to.
   * `link`: Factory image link. It should be the direct download link, not the download page.
   * `checksum`: Factory image checksum. This can be found in Google factory/OTA image download page.
   * `magisk`: Magisk apk download link. It should be the version that you are going to apply to the boot image. Also it should be the direct download link like the factory image link above.

2. Connect your phone and get output from `adb shell getprop`.

   You don't need all the values. You only need these key & values:

   * `ro.crypto.state`
   * `ro.build.ab_update`
   * `ro.boot.slot_suffix`
   * `ro.build.version.sdk`
   * `ro.product.cpu.abi`

3. Make a file named `GETPROP_OUTPUT` or edit the file from this repo, and add the key & values you got above.

   ```
   [ro.crypto.state]: [encrypted]
   [ro.build.ab_update]: [true]
   [ro.boot.slot_suffix]: [_a]
   [init.svc.vold]: [running]
   [ro.build.version.sdk]: [30]
   [ro.product.cpu.abi]: [arm64-v8a]
   ```

   You just need to copy/paste it from the terminal output. No extra work.

4. Push two files to the repo: `image_info.json`, `GETPROP_OUTPUT`. GitHub Actions will be triggered when these files are pushed or changed.

5. Wait 5 minutes, and you will have your patched boot image and the original boot image in releases tab!
