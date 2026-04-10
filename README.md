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
Updated: 2026-04-10T17:42:01.654142+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.003 |  |
| ap-east-1 | 0.687 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.612 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.959 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.706 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.210 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.519 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.444 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.181 | 4472 |
| us-east-2 | 0.134 | 1491 |
| us-gov-east-1 | 0.144 | 1638 |
| us-gov-west-1 | 0.181 | 192 |
| us-west-1 | 0.132 | 3389 |
| us-west-2 | 0.176 | 155 |

