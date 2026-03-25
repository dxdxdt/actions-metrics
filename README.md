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
Updated: 2026-03-25T21:31:43.664436+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.048 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.584 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.494 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.723 |  |
| ap-southeast-2 | 0.615 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.653 |  |
| ap-southeast-5 | 0.741 |  |
| ap-southeast-6 | 0.704 |  |
| ap-southeast-7 | 0.832 |  |
| ca-central-1 | 0.275 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.560 |  |
| eu-central-2 | 0.596 |  |
| eu-north-1 | 0.625 |  |
| eu-south-1 | 0.600 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.488 |  |
| eu-west-2 | 0.526 |  |
| eu-west-3 | 0.531 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.932 |  |
| me-south-1 | 0.898 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.690 |  |
| us-east-1 | 0.227 | 4358 |
| us-east-2 | 0.210 | 1454 |
| us-gov-east-1 | 0.203 | 1604 |
| us-gov-west-1 | 0.141 | 190 |
| us-west-1 | 0.085 | 3298 |
| us-west-2 | 0.140 | 151 |

