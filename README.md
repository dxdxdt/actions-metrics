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
Updated: 2026-03-04T16:34:41.220769+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.933 |  |
| ap-east-1 | 0.752 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.573 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.792 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.614 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.787 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.104 | 4218 |
| us-east-2 | 0.111 | 1397 |
| us-gov-east-1 | 0.093 | 1530 |
| us-gov-west-1 | 0.242 | 170 |
| us-west-1 | 0.232 | 3171 |
| us-west-2 | 0.243 | 140 |

