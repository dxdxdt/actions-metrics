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
Updated: 2026-02-24T07:45:42.661030+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.737 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.184 | 16 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.463 |  |
| eu-central-2 | 0.488 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.389 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.812 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.129 | 4174 |
| us-east-2 | 0.147 | 1374 |
| us-gov-east-1 | 0.141 | 1503 |
| us-gov-west-1 | 0.245 | 161 |
| us-west-1 | 0.197 | 3110 |
| us-west-2 | 0.238 | 130 |

