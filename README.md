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
Updated: 2026-08-19T02:14:13.365783+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.700 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.520 |  |
| ap-northeast-2 | 0.622 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.775 |  |
| ap-southeast-2 | 0.675 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.184 | 18 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.517 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.185 |  |
| sa-east-1 | 0.621 |  |
| us-east-1 | 0.151 | 5019 |
| us-east-2 | 0.147 | 1680 |
| us-gov-east-1 | 0.114 | 1848 |
| us-gov-west-1 | 0.224 | 224 |
| us-west-1 | 0.136 | 3993 |
| us-west-2 | 0.223 | 182 |

