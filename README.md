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
Updated: 2026-04-02T22:25:29.703735+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.770 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.700 |  |
| ap-northeast-3 | 0.612 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.752 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.946 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.436 |  |
| eu-central-2 | 0.453 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.458 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.391 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.809 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.532 |  |
| us-east-1 | 0.083 | 4422 |
| us-east-2 | 0.081 | 1475 |
| us-gov-east-1 | 0.079 | 1622 |
| us-gov-west-1 | 0.261 | 191 |
| us-west-1 | 0.214 | 3338 |
| us-west-2 | 0.273 | 153 |

