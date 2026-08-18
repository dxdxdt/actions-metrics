# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-08-18T22:14:36.568121+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.031 |  |
| ap-east-1 | 0.655 |  |
| ap-east-2 | 0.598 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.581 |  |
| ap-northeast-3 | 0.507 |  |
| ap-south-1 | 0.923 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.620 |  |
| ap-southeast-3 | 0.789 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.652 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.260 | 18 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.550 |  |
| eu-central-2 | 0.565 |  |
| eu-north-1 | 0.621 |  |
| eu-south-1 | 0.581 |  |
| eu-south-2 | 0.600 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.528 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.930 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.656 |  |
| us-east-1 | 0.215 | 5019 |
| us-east-2 | 0.216 | 1680 |
| us-gov-east-1 | 0.188 | 1846 |
| us-gov-west-1 | 0.175 | 224 |
| us-west-1 | 0.087 | 3992 |
| us-west-2 | 0.176 | 182 |

