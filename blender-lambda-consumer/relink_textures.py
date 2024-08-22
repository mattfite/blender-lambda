import bpy

def relink_missing_textures():
    # Define the directory where textures are located
    texture_directory = "/tmp"

    # Iterate through all images in the .blend file
    for image in bpy.data.images:
        if image.source == 'FILE' and image.filepath:
            if not image.has_data:  # This checks if the image is missing
                print(f"Relinking missing texture: {image.filepath}")
                image.filepath = bpy.path.abspath("//" + texture_directory + "/" + bpy.path.basename(image.filepath))
                image.reload()

# Call the function to relink textures
relink_missing_textures()
