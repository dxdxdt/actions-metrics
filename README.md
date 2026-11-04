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
Updated: 2026-11-04T12:42:28.622820+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.730 |  |
| ap-east-1 | 0.543 |  |
| ap-east-2 | 0.481 |  |
| ap-northeast-1 | 0.395 |  |
| ap-northeast-2 | 0.462 |  |
| ap-northeast-3 | 0.410 |  |
| ap-south-1 | 0.621 |  |
| ap-south-2 | 0.633 |  |
| ap-southeast-1 | 0.602 |  |
| ap-southeast-2 | 0.533 |  |
| ap-southeast-3 | 0.638 |  |
| ap-southeast-4 | 0.569 |  |
| ap-southeast-5 | 0.612 |  |
| ap-southeast-6 | 0.596 |  |
| ap-southeast-7 | 0.676 |  |
| ca-central-1 | 0.116 | 18 |
| ca-west-1 | 0.149 |  |
| eu-central-1 | 0.347 |  |
| eu-central-2 | 0.349 |  |
| eu-north-1 | 0.393 |  |
| eu-south-1 | 0.370 |  |
| eu-south-2 | 0.358 |  |
| eu-west-1 | 0.281 |  |
| eu-west-2 | 0.307 |  |
| eu-west-3 | 0.327 |  |
| il-central-1 | 0.473 |  |
| me-central-1 | 0.650 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.178 |  |
| sa-east-1 | 0.421 |  |
| us-east-1 | 0.085 | 5170 |
| us-east-2 | 0.099 | 1721 |
| us-gov-east-1 | 0.104 | 1959 |
| us-gov-west-1 | 0.138 | 244 |
| us-west-1 | 0.138 | 4206 |
| us-west-2 | 0.128 | 195 |

