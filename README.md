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
Updated: 2026-02-20T20:22:29.429196+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.036 |  |
| ap-east-1 | 0.682 |  |
| ap-east-2 | 0.605 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.527 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.640 |  |
| ap-southeast-3 | 0.797 |  |
| ap-southeast-4 | 0.681 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.695 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.264 | 16 |
| ca-west-1 | 0.200 |  |
| eu-central-1 | 0.548 |  |
| eu-central-2 | 0.571 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.588 |  |
| eu-south-2 | 0.586 |  |
| eu-west-1 | 0.472 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.537 |  |
| il-central-1 | 0.727 |  |
| me-central-1 | 0.961 |  |
| me-south-1 | 0.887 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.657 |  |
| us-east-1 | 0.208 | 4155 |
| us-east-2 | 0.203 | 1358 |
| us-gov-east-1 | 0.199 | 1493 |
| us-gov-west-1 | 0.168 | 160 |
| us-west-1 | 0.115 | 3088 |
| us-west-2 | 0.168 | 129 |

