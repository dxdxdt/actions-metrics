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
Updated: 2026-08-22T16:14:41.328165+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.062 |  |
| ap-east-1 | 0.633 |  |
| ap-east-2 | 0.575 |  |
| ap-northeast-1 | 0.454 |  |
| ap-northeast-2 | 0.560 |  |
| ap-northeast-3 | 0.482 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.861 |  |
| ap-southeast-1 | 0.710 |  |
| ap-southeast-2 | 0.587 |  |
| ap-southeast-3 | 0.766 |  |
| ap-southeast-4 | 0.626 |  |
| ap-southeast-5 | 0.728 |  |
| ap-southeast-6 | 0.622 |  |
| ap-southeast-7 | 0.812 |  |
| ca-central-1 | 0.304 | 18 |
| ca-west-1 | 0.180 |  |
| eu-central-1 | 0.574 |  |
| eu-central-2 | 0.614 |  |
| eu-north-1 | 0.615 |  |
| eu-south-1 | 0.609 |  |
| eu-south-2 | 0.619 |  |
| eu-west-1 | 0.510 |  |
| eu-west-2 | 0.545 |  |
| eu-west-3 | 0.559 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.980 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.698 |  |
| us-east-1 | 0.254 | 5046 |
| us-east-2 | 0.256 | 1681 |
| us-gov-east-1 | 0.236 | 1869 |
| us-gov-west-1 | 0.116 | 225 |
| us-west-1 | 0.058 | 4023 |
| us-west-2 | 0.114 | 184 |

