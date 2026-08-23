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
Updated: 2026-08-23T02:20:26.238082+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.614 |  |
| ap-northeast-3 | 0.538 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.932 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.824 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.791 |  |
| ap-southeast-6 | 0.692 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.223 | 18 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.492 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.462 |  |
| eu-west-3 | 0.486 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.173 | 5048 |
| us-east-2 | 0.184 | 1681 |
| us-gov-east-1 | 0.168 | 1869 |
| us-gov-west-1 | 0.187 | 225 |
| us-west-1 | 0.129 | 4030 |
| us-west-2 | 0.186 | 184 |

