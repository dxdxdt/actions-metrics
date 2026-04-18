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
Updated: 2026-04-18T12:43:18.401903+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.670 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.582 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.874 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.795 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.197 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.462 |  |
| eu-central-2 | 0.487 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.142 | 4521 |
| us-east-2 | 0.139 | 1510 |
| us-gov-east-1 | 0.164 | 1655 |
| us-gov-west-1 | 0.235 | 194 |
| us-west-1 | 0.187 | 3432 |
| us-west-2 | 0.232 | 156 |

