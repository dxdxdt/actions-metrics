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
Updated: 2026-06-10T22:49:09.101252+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.877 |  |
| ap-east-1 | 0.805 |  |
| ap-east-2 | 0.749 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.740 |  |
| ap-northeast-3 | 0.654 |  |
| ap-south-1 | 0.812 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.878 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.897 |  |
| ap-southeast-6 | 0.829 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.280 |  |
| eu-central-1 | 0.387 |  |
| eu-central-2 | 0.405 |  |
| eu-north-1 | 0.428 |  |
| eu-south-1 | 0.415 |  |
| eu-south-2 | 0.423 |  |
| eu-west-1 | 0.303 |  |
| eu-west-2 | 0.341 |  |
| eu-west-3 | 0.369 |  |
| il-central-1 | 0.538 |  |
| me-central-1 | 0.785 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.492 |  |
| us-east-1 | 0.061 | 4742 |
| us-east-2 | 0.104 | 1630 |
| us-gov-east-1 | 0.104 | 1710 |
| us-gov-west-1 | 0.324 | 198 |
| us-west-1 | 0.266 | 3655 |
| us-west-2 | 0.325 | 162 |

