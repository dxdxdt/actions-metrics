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
Updated: 2025-12-03T06:21:51.793102+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.013 |  |
| ap-east-1 | 0.700 |  |
| ap-northeast-1 | 0.507 |  |
| ap-northeast-2 | 0.621 |  |
| ap-south-1 | 0.883 |  |
| ap-southeast-1 | 0.763 |  |
| ap-southeast-2 | 0.650 |  |
| ca-central-1 | 0.245 | 15 |
| eu-central-1 | 0.537 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.561 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.518 |  |
| me-south-1 | 0.870 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.203 | 3622 |
| us-east-2 | 0.197 | 1122 |
| us-gov-east-1 | 0.184 | 1220 |
| us-gov-west-1 | 0.173 | 82 |
| us-west-1 | 0.123 | 2571 |
| us-west-2 | 0.177 | 56 |

