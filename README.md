![AirSettings_Project Banner_Github](https://github.com/airappsco/AirSettingsUI/assets/97190276/bfaf9dc9-7477-4589-9f1a-50483cf36dea)

# AirSettingsUI

# Documentation

**Compose beautiful preference panels.**

- Simple but powerful syntax (powered by [result builders](https://www.hackingwithswift.com/swift/5.4/result-builders)).
- Create nested pages and groups.
- Fully searchable.
- Native integration with SwiftUI and AppStorage.
- Comes with pre-made components: Toggle, Button, Slider, etc...
- Style components with native SwiftUI modifiers.
- Show and hide components dynamically.
- Add your own custom SwiftUI views.
- Works on iOS and macOS.

<img width="1041" alt="Screenshot 2023-08-25 at 1 57 45 PM" src="https://github.com/airappsco/AirSettingsUI/assets/97190276/077533de-5cd9-42fb-b3ff-db3832df8bf5">

## Installation

Setting is available via the [Swift Package Manager](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app). Requires iOS 15+ or macOS Monterey and up.

SSH
```
git@github.com:airappsco/AirSettingsUI.git
```

HTTPS
```
https://github.com/airappsco/AirSettingsUI.git
```

### Usage

<table>
<tr>
<td>

```swift
import AirSettings
import SwiftUI

struct ContentView: View {
    /// Setting supports `@State`, `@AppStorage`, `@Published`, and more!
    @AppStorage("isOn") var isOn = true
    
    var body: some View {
        /// Start things off with `SettingStack`.
        SettingStack {
            SettingPage(title: "Home") {
                /// Use groups to group components together.
                SettingGroup(header: "Main Group") {
                    /// Use any of the pre-made components...
                    SettingToggle(title: "This value is persisted!", isOn: $isOn)
                    
                    /// ...or define your own ones!
                    SettingCustomContent {
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160)
                            .padding(20)
                    }
                    
                    /// Nest `SettingPage` inside other `SettingPage`s!
                    SettingPage(title: "Advanced Settings") {
                        SettingText(title: "I show up on the next page!")
                    }
                }
            }
        }
    }
}
```
![The result, a generated settings page. Clicking on "Advanced Settings" presents a new page.](https://github.com/airappsco/AirSettingsUI/assets/97190276/0f20baf7-dc73-41d5-a349-ec0fc8339dc8)

</td>
<td>
</table>

### Examples

<table>
<tr>
<td>

```swift
struct ContentView: View {
    var body: some View {
        SettingStack {
            SettingPage(title: "Home") {
                SettingGroup {
                    SettingText(title: "Hello!")
                }
            }
        }
    }
}
```
</td>
<td>

![Settings view rendered with "Hello!" label](https://github.com/airappsco/AirSettingsUI/assets/97190276/af727aba-19cf-464f-ac18-7ec1a5d37d25)

</td>
</tr>
</table>


<table>
<tr>
<td>

```swift
SettingStack {
    SettingPage(title: "Home") {
        SettingGroup {
            SettingText(title: "Hello!")
        }

        SettingGroup {
            SettingPage(title: "First Page") {}
                .previewIcon("star")

            SettingPage(title: "Second Page") {}
                .previewIcon("sparkles")

            SettingPage(title: "Third Page") {}
                .previewIcon("leaf.fill")
        }
    }
}
```
</td>
<td>

![Settings view rendered with 3 row links](https://github.com/airappsco/AirSettingsUI/assets/97190276/de309b01-6998-498c-a753-7588a483475b)

</td>
</tr>
</table>


<table>
<tr>
<td>

```swift
struct ContentView: View {
    @AppStorage("isOn") var isOn = true
    @AppStorage("value") var value = Double(5)
    
    var body: some View {
        SettingStack {
            SettingPage(title: "Home") {
                SettingGroup {
                    SettingToggle(title: "On", isOn: $isOn)
                }
                
                SettingGroup(header: "Slider") {
                    SettingSlider(
                        value: $value,
                        range: 0 ... 10
                    )
                }
            }
        }
    }
}
```
</td>
<td>

![Settings view rendered with toggle and slider](https://github.com/airappsco/AirSettingsUI/assets/97190276/397d946e-e0ec-4a59-9a52-f7339213ee7d)

</td>
</tr>
</table>

<table>
<tr>
<td>

```swift
struct ContentView: View {
    @AppStorage("index") var index = 0
    
    var body: some View {
        SettingStack {
            SettingPage(title: "Home") {
                SettingGroup {
                    SettingPicker(
                        title: "Picker",
                        choices: ["A", "B", "C", "D"],
                        selectedIndex: $index
                    )
                    SettingPicker(
                        title: "Picker with menu",
                        choices: ["A", "B", "C", "D"],
                        selectedIndex: $index,
                        choicesConfiguration: .init(
                            pickerDisplayMode: .menu
                        )
                    )
                }
            }
        }
    }
}
```
</td>
<td>

![Settings view rendered with picker](https://github.com/airappsco/AirSettingsUI/assets/97190276/de60b5cc-0f40-4178-9d60-ecefb9877ef7)

</td>
</tr>
</table>


<table>
<tr>
<td>

```swift
SettingStack {
    SettingPage(title: "Home") {
        SettingCustomView {
            Color.blue
                .opacity(0.1)
                .cornerRadius(12)
                .overlay {
                    Text("Put anything here!")
                        .foregroundColor(.blue)
                        .font(.title.bold())
                }
                .frame(height: 150)
                .padding(.horizontal, 16)
        }
    }
}
```
</td>
<td>

![Settings view rendered with "Put anything here!" label](https://github.com/airappsco/AirSettingsUI/assets/97190276/9e7b0360-1498-48f4-b14a-45e5c022e583)

</td>
</tr>
</table>

### Notes

- If multiple components have the same title, use the `id` parameter to make sure everything gets rendered correctly.

```swift
SettingText(id: "Announcement 1", title: "Hello!")
SettingText(id: "Announcement 2", title: "Hello!")
```

- Setting comes with `if-else` support!

```swift
SettingToggle(title: "Turn on", isOn: $isOn)

if isOn {
    SettingText("I'm turned on!")
}
```

- Wrap components in `SettingCustomView` to style them.

```swift
SettingCustomView {
    SettingText(title: "I'm bold!")
        .bold()
}
```

- Want to split up a Setting into multiple variables/files? Just use `@SettingBuilder`.

```swift
struct ContentView: View {
    var body: some View {
        SettingStack {
            SettingPage(title: "Settings") {
                general
                misc
            }
        }
    }
    
    @SettingBuilder var general: some Setting {
        SettingPage(title: "General") {
            SettingText(title: "General Settings")
        }
    }
    
    @SettingBuilder var misc: some Setting {
        SettingPage(title: "Misc") {
            SettingText(title: "Misc Settings")
        }
    }
}
```

- You can pass in a custom `SettingViewModel` instance for finer control.

<table>
<tr>
<td>

```swift
struct ContentView: View {
    @StateObject var settingViewModel = SettingViewModel()
    
    var body: some View {
        SettingStack(isSearchable: true, settingViewModel: settingViewModel) {
            SettingPage(title: "Settings") {
                SettingGroup {
                    SettingText(title: "Welcome to Setting!")
                }
            }
        } customNoResultsView: {
            VStack(spacing: 20) {
                Image(systemName: "xmark")
                    .font(.largeTitle)
                
                Text("No results for '\(settingViewModel.searchText)'")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
```
</td>
<td>
  
![Settings view rendered with "Put anything here!" label](https://github.com/airappsco/AirSettingsUI/assets/97190276/c6ad19f5-dcb3-4332-a2dd-de1921322fae)
  
</td>
</tr>
</table>

### Reference
This project is based of [Setting](https://github.com/aheze/Setting) created by [Andrew Zheng](https://github.com/aheze) AKA [Aheze](https://github.com/aheze). We didn't forked or adopted his project due to the requirement of AirApps distribuiting it's own open source projects and enforcing our own coding style over the project. All kudos to the creator of this repository. 
