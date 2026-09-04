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
Updated: 2026-09-04T00:35:01.048064+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.748 |  |
| ap-southeast-3 | 0.905 |  |
| ap-southeast-4 | 0.787 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.773 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.124 | 18 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.444 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.454 |  |
| eu-south-2 | 0.462 |  |
| eu-west-1 | 0.337 |  |
| eu-west-2 | 0.380 |  |
| eu-west-3 | 0.408 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.089 | 5082 |
| us-east-2 | 0.100 | 1685 |
| us-gov-east-1 | 0.095 | 1894 |
| us-gov-west-1 | 0.268 | 231 |
| us-west-1 | 0.208 | 4078 |
| us-west-2 | 0.267 | 191 |

