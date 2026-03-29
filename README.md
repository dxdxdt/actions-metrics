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
Updated: 2026-03-29T14:28:08.239736+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.865 |  |
| ap-east-1 | 0.807 |  |
| ap-east-2 | 0.731 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.879 |  |
| ap-southeast-2 | 0.791 |  |
| ap-southeast-3 | 0.939 |  |
| ap-southeast-4 | 0.833 |  |
| ap-southeast-5 | 0.903 |  |
| ap-southeast-6 | 0.867 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.099 | 16 |
| ca-west-1 | 0.300 |  |
| eu-central-1 | 0.376 |  |
| eu-central-2 | 0.404 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.408 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.307 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.358 |  |
| il-central-1 | 0.558 |  |
| me-central-1 | 0.768 |  |
| me-south-1 | 0.746 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.509 |  |
| us-east-1 | 0.056 | 4391 |
| us-east-2 | 0.090 | 1464 |
| us-gov-east-1 | 0.098 | 1612 |
| us-gov-west-1 | 0.308 | 190 |
| us-west-1 | 0.248 | 3317 |
| us-west-2 | 0.309 | 152 |

