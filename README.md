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
Updated: 2026-02-13T05:54:46.573838+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.036 |  |
| ap-east-1 | 0.674 |  |
| ap-northeast-1 | 0.495 |  |
| ap-northeast-2 | 0.605 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.748 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.799 |  |
| ap-southeast-4 | 0.676 |  |
| ca-central-1 | 0.236 | 16 |
| ca-west-1 | 0.180 |  |
| eu-central-1 | 0.546 |  |
| eu-central-2 | 0.564 |  |
| eu-north-1 | 0.590 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.585 |  |
| eu-west-1 | 0.465 |  |
| eu-west-2 | 0.500 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.710 |  |
| me-central-1 | 0.949 |  |
| me-south-1 | 0.907 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.204 | 4113 |
| us-east-2 | 0.177 | 1335 |
| us-gov-east-1 | 0.176 | 1456 |
| us-gov-west-1 | 0.151 | 145 |
| us-west-1 | 0.118 | 3051 |
| us-west-2 | 0.152 | 125 |

