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
Updated: 2026-02-24T12:45:15.172692+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.794 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.722 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.870 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.929 |  |
| ap-southeast-4 | 0.833 |  |
| ap-southeast-5 | 0.900 |  |
| ap-southeast-6 | 0.836 |  |
| ap-southeast-7 | 0.985 |  |
| ca-central-1 | 0.119 | 16 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.396 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.427 |  |
| eu-south-2 | 0.431 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.377 |  |
| il-central-1 | 0.584 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.753 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.496 |  |
| us-east-1 | 0.067 | 4177 |
| us-east-2 | 0.084 | 1374 |
| us-gov-east-1 | 0.100 | 1504 |
| us-gov-west-1 | 0.307 | 161 |
| us-west-1 | 0.252 | 3111 |
| us-west-2 | 0.323 | 130 |

