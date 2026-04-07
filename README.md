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
Updated: 2026-04-07T22:31:44.208618+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.691 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.781 |  |
| ap-southeast-5 | 0.848 |  |
| ap-southeast-6 | 0.813 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.476 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.493 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.438 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.545 |  |
| us-east-1 | 0.097 | 4455 |
| us-east-2 | 0.085 | 1489 |
| us-gov-east-1 | 0.083 | 1634 |
| us-gov-west-1 | 0.245 | 191 |
| us-west-1 | 0.209 | 3372 |
| us-west-2 | 0.254 | 154 |

