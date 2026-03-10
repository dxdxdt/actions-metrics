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
Updated: 2026-03-10T19:33:48.890489+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.760 |  |
| ap-east-2 | 0.704 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.692 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.753 |  |
| ap-southeast-3 | 0.892 |  |
| ap-southeast-4 | 0.855 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.936 |  |
| ca-central-1 | 0.163 | 16 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.507 |  |
| eu-south-1 | 0.486 |  |
| eu-south-2 | 0.493 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.628 |  |
| me-central-1 | 0.828 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.551 |  |
| us-east-1 | 0.111 | 4254 |
| us-east-2 | 0.116 | 1417 |
| us-gov-east-1 | 0.126 | 1555 |
| us-gov-west-1 | 0.262 | 177 |
| us-west-1 | 0.220 | 3207 |
| us-west-2 | 0.264 | 144 |

