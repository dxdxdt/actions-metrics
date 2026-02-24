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
Updated: 2026-02-24T06:52:02.144322+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.049 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.591 |  |
| ap-northeast-1 | 0.472 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.498 |  |
| ap-south-1 | 0.949 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.729 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.787 |  |
| ap-southeast-4 | 0.672 |  |
| ap-southeast-5 | 0.756 |  |
| ap-southeast-6 | 0.685 |  |
| ap-southeast-7 | 0.834 |  |
| ca-central-1 | 0.268 | 16 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.558 |  |
| eu-central-2 | 0.572 |  |
| eu-north-1 | 0.597 |  |
| eu-south-1 | 0.589 |  |
| eu-south-2 | 0.592 |  |
| eu-west-1 | 0.474 |  |
| eu-west-2 | 0.508 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.742 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.889 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.657 |  |
| us-east-1 | 0.209 | 4173 |
| us-east-2 | 0.185 | 1374 |
| us-gov-east-1 | 0.183 | 1503 |
| us-gov-west-1 | 0.146 | 161 |
| us-west-1 | 0.116 | 3110 |
| us-west-2 | 0.149 | 130 |

