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
Updated: 2026-04-15T13:06:09.866809+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.082 |  |
| ap-east-1 | 0.612 |  |
| ap-east-2 | 0.549 |  |
| ap-northeast-1 | 0.428 |  |
| ap-northeast-2 | 0.535 |  |
| ap-northeast-3 | 0.456 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.861 |  |
| ap-southeast-1 | 0.687 |  |
| ap-southeast-2 | 0.613 |  |
| ap-southeast-3 | 0.746 |  |
| ap-southeast-4 | 0.653 |  |
| ap-southeast-5 | 0.710 |  |
| ap-southeast-6 | 0.642 |  |
| ap-southeast-7 | 0.793 |  |
| ca-central-1 | 0.305 | 16 |
| ca-west-1 | 0.165 |  |
| eu-central-1 | 0.598 |  |
| eu-central-2 | 0.610 |  |
| eu-north-1 | 0.645 |  |
| eu-south-1 | 0.635 |  |
| eu-south-2 | 0.630 |  |
| eu-west-1 | 0.524 |  |
| eu-west-2 | 0.561 |  |
| eu-west-3 | 0.580 |  |
| il-central-1 | 0.768 |  |
| me-central-1 | 0.946 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.257 |  |
| sa-east-1 | 0.702 |  |
| us-east-1 | 0.245 | 4506 |
| us-east-2 | 0.220 | 1500 |
| us-gov-east-1 | 0.222 | 1648 |
| us-gov-west-1 | 0.108 | 193 |
| us-west-1 | 0.095 | 3417 |
| us-west-2 | 0.104 | 156 |

