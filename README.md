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
Updated: 2026-07-04T17:58:30.021878+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.098 |  |
| ap-east-1 | 0.636 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.459 |  |
| ap-northeast-2 | 0.562 |  |
| ap-northeast-3 | 0.486 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.715 |  |
| ap-southeast-2 | 0.593 |  |
| ap-southeast-3 | 0.773 |  |
| ap-southeast-4 | 0.635 |  |
| ap-southeast-5 | 0.734 |  |
| ap-southeast-6 | 0.629 |  |
| ap-southeast-7 | 0.812 |  |
| ca-central-1 | 0.303 | 16 |
| ca-west-1 | 0.184 |  |
| eu-central-1 | 0.587 |  |
| eu-central-2 | 0.611 |  |
| eu-north-1 | 0.641 |  |
| eu-south-1 | 0.628 |  |
| eu-south-2 | 0.645 |  |
| eu-west-1 | 0.510 |  |
| eu-west-2 | 0.540 |  |
| eu-west-3 | 0.558 |  |
| il-central-1 | 0.745 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.685 |  |
| us-east-1 | 0.246 | 4819 |
| us-east-2 | 0.221 | 1652 |
| us-gov-east-1 | 0.232 | 1728 |
| us-gov-west-1 | 0.124 | 200 |
| us-west-1 | 0.064 | 3740 |
| us-west-2 | 0.125 | 164 |

