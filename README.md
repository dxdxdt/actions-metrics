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
Updated: 2026-02-23T09:45:43.404255+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.943 |  |
| ap-east-1 | 0.761 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.600 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.937 |  |
| ap-southeast-1 | 0.828 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.786 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 0.930 |  |
| ca-central-1 | 0.139 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.487 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.438 |  |
| il-central-1 | 0.616 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.810 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.561 |  |
| us-east-1 | 0.106 | 4170 |
| us-east-2 | 0.103 | 1371 |
| us-gov-east-1 | 0.102 | 1502 |
| us-gov-west-1 | 0.250 | 160 |
| us-west-1 | 0.222 | 3101 |
| us-west-2 | 0.264 | 130 |

