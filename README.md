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
Updated: 2026-08-19T23:15:58.855958+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.621 |  |
| ap-northeast-1 | 0.505 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.533 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.767 |  |
| ap-southeast-2 | 0.664 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.705 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.704 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.246 | 18 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.508 |  |
| eu-central-2 | 0.533 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.543 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.683 |  |
| me-central-1 | 0.910 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.616 |  |
| us-east-1 | 0.176 | 5025 |
| us-east-2 | 0.203 | 1680 |
| us-gov-east-1 | 0.201 | 1856 |
| us-gov-west-1 | 0.194 | 224 |
| us-west-1 | 0.135 | 3999 |
| us-west-2 | 0.190 | 183 |

