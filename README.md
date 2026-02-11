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
Updated: 2026-02-11T19:52:37.037312+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.729 |  |
| ap-northeast-1 | 0.550 |  |
| ap-northeast-2 | 0.659 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.809 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.865 |  |
| ap-southeast-4 | 0.737 |  |
| ca-central-1 | 0.192 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.485 |  |
| eu-north-1 | 0.513 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.388 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.443 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.868 |  |
| me-south-1 | 0.827 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.135 | 4106 |
| us-east-2 | 0.155 | 1331 |
| us-gov-east-1 | 0.154 | 1452 |
| us-gov-west-1 | 0.230 | 143 |
| us-west-1 | 0.169 | 3042 |
| us-west-2 | 0.235 | 125 |

