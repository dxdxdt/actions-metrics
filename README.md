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
Updated: 2026-09-20T20:03:58.050711+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.033 |  |
| ap-east-1 | 0.649 |  |
| ap-east-2 | 0.589 |  |
| ap-northeast-1 | 0.471 |  |
| ap-northeast-2 | 0.571 |  |
| ap-northeast-3 | 0.496 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.747 |  |
| ap-southeast-2 | 0.613 |  |
| ap-southeast-3 | 0.781 |  |
| ap-southeast-4 | 0.654 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.646 |  |
| ap-southeast-7 | 0.828 |  |
| ca-central-1 | 0.251 | 18 |
| ca-west-1 | 0.185 |  |
| eu-central-1 | 0.549 |  |
| eu-central-2 | 0.572 |  |
| eu-north-1 | 0.600 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.473 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.523 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.218 | 5110 |
| us-east-2 | 0.218 | 1686 |
| us-gov-east-1 | 0.209 | 1920 |
| us-gov-west-1 | 0.142 | 234 |
| us-west-1 | 0.081 | 4130 |
| us-west-2 | 0.142 | 192 |

