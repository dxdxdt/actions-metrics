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
Updated: 2026-11-14T15:26:30.733914+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.688 |  |
| ap-east-1 | 0.582 |  |
| ap-east-2 | 0.534 |  |
| ap-northeast-1 | 0.448 |  |
| ap-northeast-2 | 0.520 |  |
| ap-northeast-3 | 0.465 |  |
| ap-south-1 | 0.630 |  |
| ap-south-2 | 0.674 |  |
| ap-southeast-1 | 0.639 |  |
| ap-southeast-2 | 0.571 |  |
| ap-southeast-3 | 0.679 |  |
| ap-southeast-4 | 0.631 |  |
| ap-southeast-5 | 0.651 |  |
| ap-southeast-6 | 0.588 |  |
| ap-southeast-7 | 0.710 |  |
| ca-central-1 | 0.098 | 18 |
| ca-west-1 | 0.158 |  |
| eu-central-1 | 0.318 |  |
| eu-central-2 | 0.328 |  |
| eu-north-1 | 0.357 |  |
| eu-south-1 | 0.330 |  |
| eu-south-2 | 0.326 |  |
| eu-west-1 | 0.256 |  |
| eu-west-2 | 0.280 |  |
| eu-west-3 | 0.299 |  |
| il-central-1 | 0.439 |  |
| me-central-1 | 0.581 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.625 |  |
| mx-central-1 | 0.192 |  |
| sa-east-1 | 0.392 |  |
| us-east-1 | 0.059 | 5185 |
| us-east-2 | 0.092 | 1727 |
| us-gov-east-1 | 0.093 | 1960 |
| us-gov-west-1 | 0.207 | 247 |
| us-west-1 | 0.181 | 4216 |
| us-west-2 | 0.203 | 197 |

