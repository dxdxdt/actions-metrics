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
Updated: 2026-02-12T19:45:20.815372+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.902 |  |
| ap-east-1 | 0.796 |  |
| ap-northeast-1 | 0.623 |  |
| ap-northeast-2 | 0.724 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.878 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.797 |  |
| ca-central-1 | 0.140 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.417 |  |
| eu-central-2 | 0.436 |  |
| eu-north-1 | 0.471 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.456 |  |
| eu-west-1 | 0.344 |  |
| eu-west-2 | 0.374 |  |
| eu-west-3 | 0.400 |  |
| il-central-1 | 0.589 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.766 |  |
| sa-east-1 | 0.516 |  |
| us-east-1 | 0.087 | 4112 |
| us-east-2 | 0.116 | 1334 |
| us-gov-east-1 | 0.121 | 1453 |
| us-gov-west-1 | 0.282 | 145 |
| us-west-1 | 0.232 | 3049 |
| us-west-2 | 0.285 | 125 |

