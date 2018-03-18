import SpriteKit

public extension SKTextureAtlas {
    
    /**
     * This function returns an SKTextureAtlas as you woudan
     * expect it by calling SKTextureAtlas(named name: String).
     *
     * This workaround is only neccesary, because
     * SKTextureAtlas(named name: String) did not load
     * the .atlas files from the resource folder.
     */
    public static func createTextureAtlas(named name: String) -> SKTextureAtlas {
        let subdirectory = name.hasSuffix(".atlas") ? name : name + ".atlas"
        let urls = Bundle.main.urls(forResourcesWithExtension: "png", subdirectory: subdirectory) ?? []
        var textureDictionary: [String: UIImage] = [:]
        for url in urls {
            let textureFileName = url.lastPathComponent
            let textureFilePath = subdirectory + "/" + textureFileName
            let textureName = String(textureFileName.split(separator: ".")[0])
            
            textureDictionary[textureName] = UIImage(named: textureFilePath)
        }
        
        return SKTextureAtlas(dictionary: textureDictionary)
    }
    
    /**
     * Returns a list of all SKTextures stored in the texture atlas.
     */
    public var textures: [SKTexture] {
        return self.textureNames.sorted(by: { $0 < $1 }).map { self.textureNamed($0) }
    }
}
