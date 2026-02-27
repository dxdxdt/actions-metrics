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
Updated: 2026-02-27T22:16:47.125763+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.676 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.575 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.905 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.401 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.462 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.843 |  |
| me-south-1 | 0.802 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.118 | 4194 |
| us-east-2 | 0.098 | 1382 |
| us-gov-east-1 | 0.095 | 1518 |
| us-gov-west-1 | 0.214 | 162 |
| us-west-1 | 0.216 | 3137 |
| us-west-2 | 0.210 | 133 |

