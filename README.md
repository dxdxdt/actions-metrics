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
Updated: 2026-07-20T22:51:08.107119+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.932 |  |
| ap-east-1 | 0.745 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.934 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.723 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.744 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.476 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.399 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.114 | 4890 |
| us-east-2 | 0.111 | 1658 |
| us-gov-east-1 | 0.099 | 1771 |
| us-gov-west-1 | 0.242 | 205 |
| us-west-1 | 0.182 | 3812 |
| us-west-2 | 0.239 | 167 |

