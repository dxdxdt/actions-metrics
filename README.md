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
Updated: 2026-08-26T02:20:58.310773+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.871 |  |
| ap-east-1 | 0.815 |  |
| ap-east-2 | 0.756 |  |
| ap-northeast-1 | 0.631 |  |
| ap-northeast-2 | 0.744 |  |
| ap-northeast-3 | 0.663 |  |
| ap-south-1 | 0.812 |  |
| ap-south-2 | 0.857 |  |
| ap-southeast-1 | 0.889 |  |
| ap-southeast-2 | 0.786 |  |
| ap-southeast-3 | 0.934 |  |
| ap-southeast-4 | 0.835 |  |
| ap-southeast-5 | 0.913 |  |
| ap-southeast-6 | 0.825 |  |
| ap-southeast-7 | 0.992 |  |
| ca-central-1 | 0.110 | 18 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.374 |  |
| eu-central-2 | 0.400 |  |
| eu-north-1 | 0.447 |  |
| eu-south-1 | 0.405 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.297 |  |
| eu-west-2 | 0.334 |  |
| eu-west-3 | 0.357 |  |
| il-central-1 | 0.532 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.477 |  |
| us-east-1 | 0.045 | 5067 |
| us-east-2 | 0.071 | 1684 |
| us-gov-east-1 | 0.091 | 1885 |
| us-gov-west-1 | 0.313 | 228 |
| us-west-1 | 0.265 | 4054 |
| us-west-2 | 0.317 | 188 |

