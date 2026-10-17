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
Updated: 2026-10-17T19:55:13.034013+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.622 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.612 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.670 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.727 |  |
| ap-southeast-7 | 0.868 |  |
| ca-central-1 | 0.210 | 18 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.515 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.521 |  |
| eu-south-2 | 0.503 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.453 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.674 |  |
| me-central-1 | 0.853 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.602 |  |
| us-east-1 | 0.163 | 5149 |
| us-east-2 | 0.186 | 1701 |
| us-gov-east-1 | 0.191 | 1947 |
| us-gov-west-1 | 0.198 | 238 |
| us-west-1 | 0.144 | 4175 |
| us-west-2 | 0.198 | 195 |

