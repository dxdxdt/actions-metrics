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
Updated: 2026-03-18T20:28:41.507237+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.006 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.771 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.831 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.712 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.242 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.533 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.579 |  |
| eu-south-1 | 0.548 |  |
| eu-south-2 | 0.563 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.482 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.862 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.624 |  |
| us-east-1 | 0.184 | 4306 |
| us-east-2 | 0.180 | 1433 |
| us-gov-east-1 | 0.188 | 1586 |
| us-gov-west-1 | 0.183 | 189 |
| us-west-1 | 0.126 | 3252 |
| us-west-2 | 0.185 | 148 |

