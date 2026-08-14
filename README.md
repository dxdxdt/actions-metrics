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
Updated: 2026-08-14T22:14:36.517498+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.679 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.854 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.761 |  |
| ap-southeast-7 | 0.932 |  |
| ca-central-1 | 0.189 | 18 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.134 | 4997 |
| us-east-2 | 0.149 | 1679 |
| us-gov-east-1 | 0.150 | 1827 |
| us-gov-west-1 | 0.238 | 222 |
| us-west-1 | 0.185 | 3949 |
| us-west-2 | 0.239 | 177 |

